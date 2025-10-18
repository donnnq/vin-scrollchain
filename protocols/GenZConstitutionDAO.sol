// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenZConstitutionDAO {
    address public admin;

    struct ArticleEntry {
        string title;
        string region;
        string author;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool archived;
    }

    ArticleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonArticle(string memory title, string memory region, string memory author, string memory emotionalTag) external onlyAdmin {
        entries.push(ArticleEntry(title, region, author, emotionalTag, true, false, false));
    }

    function ratifyArticle(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function archiveArticle(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getArticleEntry(uint256 index) external view returns (ArticleEntry memory) {
        return entries[index];
    }
}
