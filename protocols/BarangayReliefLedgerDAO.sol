// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayReliefLedgerDAO {
    address public admin;

    struct ReliefEntry {
        string barangayName;
        string purokID;
        string programName;
        string emotionalTag;
        bool summoned;
        bool delivered;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRelief(string memory barangayName, string memory purokID, string memory programName, string memory emotionalTag) external onlyAdmin {
        entries.push(ReliefEntry(barangayName, purokID, programName, emotionalTag, true, false, false));
    }

    function deliverRelief(uint256 index) external onlyAdmin {
        entries[index].delivered = true;
    }

    function sealRelief(uint256 index) external onlyAdmin {
        require(entries[index].delivered, "Must be delivered first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
