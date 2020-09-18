#!/bin/sh
mvn clean archetype:create-from-project -Darchetype.properties=archetype.properties
archetype=target/generated-sources/archetype/
mkdir --parents "${archetype}src/test/resources/projects/basic/"
echo 'package' > "${archetype}src/test/resources/projects/basic/goal.txt"
cp archetype-test.properties "${archetype}src/test/resources/projects/basic/archetype.properties"
cd ${archetype}
sed -i 's/package ${groupId};/package ${package};/' src/main/resources/archetype-resources/src/main/java/Application.java
sed -i 's/${groupId}.client/io.zeebe.client/' src/main/resources/archetype-resources/src/main/java/Application.java
mvn eclipse:eclipse integration-test # FIXME doesn't generate m2e project, better copy .project, .classpath & .settings from m2e project
cd target/test-classes/projects/basic/project/zeebe-demo-test/
mvn eclipse:eclipse # FIXME doesn't generate m2e project, better copy .project, .classpath & .settings from m2e project
cd -
mvn install
# either manually add the archetype into the Eclipse archetype catalogue using its Maven coordinates
# or run mvn clean install on the archetype project in Eclipse (integration test must probably be skipped)
