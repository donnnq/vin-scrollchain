// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IllegalFirearmScanCodex {
    address public admin;

    struct FirearmEntry {
        string weaponSerial;
        string recoveryZone;
        string scanClause;
        string emotionalTag;
        bool summoned;
        bool scanned;
        bool sealed;
    }

    FirearmEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonScan(string memory weaponSerial, string memory recoveryZone, string memory scanClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FirearmEntry(weaponSerial, recoveryZone, scanClause, emotionalTag, true, false, false));
    }

    function confirmScan(uint256 index) external onlyAdmin {
        entries[index].scanned = true;
    }

    function sealFirearmEntry(uint256 index) external onlyAdmin {
        require(entries[index].scanned, "Must be scanned first");
        entries[index].sealed = true;
    }

    function getFirearmEntry(uint256 index) external view returns (FirearmEntry memory) {
        return entries[index];
    }
}
