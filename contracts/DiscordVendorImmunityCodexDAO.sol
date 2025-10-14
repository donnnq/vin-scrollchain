// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiscordVendorImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string vendorName;
        string breachVector;
        string immunityClause;
        string emotionalTag;
        bool sealed;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _vendorName, string memory _breachVector, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_vendorName, _breachVector, _immunityClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
