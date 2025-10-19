// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicrosoftBatVinDiplomacyCodex {
    address public admin;

    struct DiplomacyEntry {
        string partnerName;
        string treatyName;
        string productionGoal;
        string emotionalTag;
        bool summoned;
        bool signed;
        bool sealed;
    }

    DiplomacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTreaty(string memory partnerName, string memory treatyName, string memory productionGoal, string memory emotionalTag) external onlyAdmin {
        entries.push(DiplomacyEntry(partnerName, treatyName, productionGoal, emotionalTag, true, false, false));
    }

    function confirmSignature(uint256 index) external onlyAdmin {
        entries[index].signed = true;
    }

    function sealDiplomacyEntry(uint256 index) external onlyAdmin {
        require(entries[index].signed, "Must be signed first");
        entries[index].sealed = true;
    }

    function getDiplomacyEntry(uint256 index) external view returns (DiplomacyEntry memory) {
        return entries[index];
    }
}
