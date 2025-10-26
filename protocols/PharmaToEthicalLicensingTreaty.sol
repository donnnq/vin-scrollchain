// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PharmaToEthicalLicensingTreaty {
    address public steward;

    struct LicensingEntry {
        string medicineName; // "QuantumPainX"
        string licensingMethod; // "Non-exclusive, dignity-based, scrollchain-audited"
        string originCountry; // "Philippines"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    LicensingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyLicensing(string memory medicineName, string memory licensingMethod, string memory originCountry, string memory emotionalTag) external onlySteward {
        entries.push(LicensingEntry(medicineName, licensingMethod, originCountry, emotionalTag, true, false));
    }

    function sealLicensingEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getLicensingEntry(uint256 index) external view returns (LicensingEntry memory) {
        return entries[index];
    }
}
