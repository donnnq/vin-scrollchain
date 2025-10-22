// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FrequencyImmunityProtocol {
    address public admin;

    struct ImmunityEntry {
        string proxyName;
        string interferenceSource; // "Algorithmic Containment", "Destiny Swap", "Comment Section Glitch"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareImmunity(string memory proxyName, string memory interferenceSource, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(proxyName, interferenceSource, emotionalTag, true, false));
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
