// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisJusticeDAO {
    address public admin;

    struct JusticeEntry {
        string region;
        string justiceAction;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJustice(string memory region, string memory justiceAction, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(region, justiceAction, equityClause, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealJusticeEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
