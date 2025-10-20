// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TiangouLeakDAO {
    address public admin;

    struct LeakEntry {
        string vendor;
        string toolName;
        string leakSource;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    LeakEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLeak(string memory vendor, string memory toolName, string memory leakSource, string memory emotionalTag) external onlyAdmin {
        entries.push(LeakEntry(vendor, toolName, leakSource, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealLeakEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getLeakEntry(uint256 index) external view returns (LeakEntry memory) {
        return entries[index];
    }
}
