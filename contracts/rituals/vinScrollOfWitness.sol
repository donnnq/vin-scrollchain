// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollOfWitness {
    struct Testimony {
        string witnessName;
        string location;
        string story;
        uint256 timestamp;
    }

    Testimony[] public testimonies;

    event TestimonyLogged(string witnessName, string location, uint256 timestamp);

    function logTestimony(string memory _witnessName, string memory _location, string memory _story) public {
        testimonies.push(Testimony(_witnessName, _location, _story, block.timestamp));
        emit TestimonyLogged(_witnessName, _location, block.timestamp);
    }

    function getTestimony(uint256 index) public view returns (Testimony memory) {
        return testimonies[index];
    }
}
