// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfSignedHousingBlessings {
    address public scrollkeeper;

    struct HousingBlessing {
        string familyName;
        string oldLocation;
        string newUnitAssigned;
        bool agreementSigned;
        bool demolitionCompleted;
        uint256 timestamp;
    }

    HousingBlessing[] public blessings;

    event BlessingSigned(string familyName, string newUnitAssigned);
    event OldShelterDemolished(string familyName, string oldLocation);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerBlessing(string memory familyName, string memory oldLocation) external onlyScrollkeeper {
        blessings.push(HousingBlessing(familyName, oldLocation, "", false, false, block.timestamp));
    }

    function signAgreement(uint256 index, string memory newUnitAssigned) external onlyScrollkeeper {
        blessings[index].agreementSigned = true;
        blessings[index].newUnitAssigned = newUnitAssigned;
        emit BlessingSigned(blessings[index].familyName, newUnitAssigned);
    }

    function demolishOldShelter(uint256 index) external onlyScrollkeeper {
        blessings[index].demolitionCompleted = true;
        emit OldShelterDemolished(blessings[index].familyName, blessings[index].oldLocation);
    }

    function getBlessing(uint256 index) external view returns (string memory, string memory, string memory, bool, bool, uint256) {
        HousingBlessing memory b = blessings[index];
        return (b.familyName, b.oldLocation, b.newUnitAssigned, b.agreementSigned, b.demolitionCompleted, b.timestamp);
    }

    function totalBlessings() external view returns (uint256) {
        return blessings.length;
    }
}
