// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollPetitioner {
    struct Petition {
        string petitionerName;
        string cause;
        uint timestamp;
    }

    Petition[] public petitions;
    event PetitionLogged(string name, string cause);

    function submitPetition(string memory name, string memory cause) public {
        petitions.push(Petition(name, cause, block.timestamp));
        emit PetitionLogged(name, cause);
    }

    function getAllPetitions() public view returns (Petition[] memory) {
        return petitions;
    }
}
