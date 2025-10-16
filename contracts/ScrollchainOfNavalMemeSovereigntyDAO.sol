// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfNavalMemeSovereigntyDAO {
    address public admin;

    struct MemeEntry {
        string vesselLabel;
        string memeClause;
        string emotionalTag;
        bool archived;
    }

    MemeEntry[] public memes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory vesselLabel, string memory memeClause, string memory emotionalTag) external onlyAdmin {
        memes.push(MemeEntry(vesselLabel, memeClause, emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        memes[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (MemeEntry memory) {
        return memes[index];
    }
}
