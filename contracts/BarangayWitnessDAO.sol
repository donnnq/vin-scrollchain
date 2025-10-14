// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWitnessDAO {
    address public admin;

    struct Testimony {
        string witnessName;
        string projectLocation;
        string observation;
        string emotionalTag;
        bool verified;
    }

    Testimony[] public testimonies;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTestimony(string memory _witnessName, string memory _projectLocation, string memory _observation, string memory _emotionalTag) external onlyAdmin {
        testimonies.push(Testimony(_witnessName, _projectLocation, _observation, _emotionalTag, false));
    }

    function verifyTestimony(uint256 index) external onlyAdmin {
        testimonies[index].verified = true;
    }

    function getTestimony(uint256 index) external view returns (Testimony memory) {
        return testimonies[index];
    }
}
