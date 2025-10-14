// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GetahVirusSurveillanceDAO {
    address public admin;

    struct SurveillanceEntry {
        string province;
        string livestockType;
        string viralStrain;
        string emotionalTag;
        bool confirmed;
    }

    SurveillanceEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _province, string memory _livestockType, string memory _viralStrain, string memory _emotionalTag) external onlyAdmin {
        registry.push(SurveillanceEntry(_province, _livestockType, _viralStrain, _emotionalTag, false));
    }

    function confirmEntry(uint256 index) external onlyAdmin {
        registry[index].confirmed = true;
    }

    function getEntry(uint256 index) external view returns (SurveillanceEntry memory) {
        return registry[index];
    }
}
