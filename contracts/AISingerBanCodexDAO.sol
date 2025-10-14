// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AISingerBanCodexDAO {
    address public admin;

    struct BanEntry {
        string platform;
        string contentType;
        string banClause;
        string emotionalTag;
        bool enforced;
    }

    BanEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBan(string memory _platform, string memory _contentType, string memory _banClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(BanEntry(_platform, _contentType, _banClause, _emotionalTag, false));
    }

    function enforceBan(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getBan(uint256 index) external view returns (BanEntry memory) {
        return codex[index];
    }
}
