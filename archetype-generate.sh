#!/bin/sh
mvn clean archetype:create-from-project -Darchetype.properties=archetype.properties
archetype=target/generated-sources/archetype
mkdir --parents "${archetype}src/it/projects/basic"
echo 'package' > "${archetype}src/it/projects/basic/goal.txt"
cp archetype-test.properties "${archetype}src/it/projects/basic/archetype.properties"
mvn clean install