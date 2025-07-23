// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperShelterAssignmentLedger {
    address public scrollkeeper;

    struct FamilyHousingRecord {
        string familyName;
        string oldShelterLocation;
        bool hasSignedAgreement;
        string newUnitAssigned;
        bool oldUnitDemolished;
        uint256 timestamp;
    }

    FamilyHousingRecord[] public housingLedger;

    event AgreementSigned(string familyName, string newUnit);
    event OldUnitCleared(string familyName, string location);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerFamily(string memory familyName, string memory oldShelterLocation) external onlyScrollkeeper {
        housingLedger.push(FamilyHousingRecord(familyName, oldShelterLocation, false, "", false, block.timestamp));
    }

    function signAgreement(uint256 index, string memory newUnitAssigned) external onlyScrollkeeper {
        FamilyHousingRecord storage r = housingLedger[index];
        r.hasSignedAgreement = true;
        r.newUnitAssigned = newUnitAssigned;
        emit AgreementSigned(r.familyName, newUnitAssigned);
    }

    function demolishOldShelter(uint256 index) external onlyScrollkeeper {
        housingLedger[index].oldUnitDemolished = true;
        emit OldUnitCleared(housingLedger[index].familyName, housingLedger[index].oldShelterLocation);
    }

    function getRecord(uint256 index) external view returns (string memory, string memory, bool, string memory, bool, uint256) {
        FamilyHousingRecord memory r = housingLedger[index];
        return (r.familyName, r.oldShelterLocation, r.hasSignedAgreement, r.newUnitAssigned, r.oldUnitDemolished, r.timestamp);
    }

    function totalFamilies() external view returns (uint256) {
        return housingLedger.length;
    }
}
