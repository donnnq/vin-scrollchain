// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactCheckSovereigntyCodex {
    address public admin;

    struct FactEntry {
        string claimTopic;
        string sourceName;
        string verificationMethod;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    FactEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFact(string memory claimTopic, string memory sourceName, string memory verificationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(FactEntry(claimTopic, sourceName, verificationMethod, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealFactEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getFactEntry(uint256 index) external view returns (FactEntry memory) {
        return entries[index];
    }
}
