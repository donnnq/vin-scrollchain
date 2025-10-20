// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CeasefireBreachAuditDAO {
    address public admin;

    struct BreachEntry {
        string region;
        string accusedParty;
        string breachType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBreach(string memory region, string memory accusedParty, string memory breachType, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(region, accusedParty, breachType, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealBreachEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
