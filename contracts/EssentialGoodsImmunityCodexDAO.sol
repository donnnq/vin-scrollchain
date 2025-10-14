// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EssentialGoodsImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string itemName;
        string category;
        string justification;
        string emotionalTag;
        bool exempted;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _itemName, string memory _category, string memory _justification, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_itemName, _category, _justification, _emotionalTag, false));
    }

    function exemptItem(uint256 index) external onlyAdmin {
        codex[index].exempted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
