// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReefAllyRegistryDAO {
    address public steward;

    struct Ally {
        string species;
        string allyID;
        string corridor;
        string protectionTag;
    }

    Ally[] public registry;

    event AllyRegistered(string species, string allyID, string corridor, string protectionTag);
    event AllyVerified(string allyID, string corridor);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function registerAlly(
        string memory species,
        string memory allyID,
        string memory corridor,
        string memory protectionTag
    ) public onlySteward {
        registry.push(Ally(species, allyID, corridor, protectionTag));
        emit AllyRegistered(species, allyID, corridor, protectionTag);
    }

    function verifyAlly(string memory allyID, string memory corridor) public onlySteward {
        emit AllyVerified(allyID, corridor);
    }
}
