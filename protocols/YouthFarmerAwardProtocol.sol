// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthFarmerAwardProtocol {
    address public admin;

    struct AwardEntry {
        string name;
        string purokZone;
        string awardType; // "Animal Care", "Crop Sovereignty", "Aquaponics Mastery", "Compost Innovation"
        string emotionalTag;
        bool summoned;
        bool awarded;
        bool sealed;
    }

    AwardEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAward(string memory name, string memory purokZone, string memory awardType, string memory emotionalTag) external onlyAdmin {
        entries.push(AwardEntry(name, purokZone, awardType, emotionalTag, true, false, false));
    }

    function confirmAwarding(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function sealAwardEntry(uint256 index) external onlyAdmin {
        require(entries[index].awarded, "Must be awarded first");
        entries[index].sealed = true;
    }

    function getAwardEntry(uint256 index) external view returns (AwardEntry memory) {
        return entries[index];
    }
}
