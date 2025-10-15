// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DZMMBroadcastVerificationCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string broadcastTitle;
        string verificationClause;
        string emotionalTag;
        bool verified;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _broadcastTitle, string memory _verificationClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_broadcastTitle, _verificationClause, _emotionalTag, false));
    }

    function verifyBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].verified = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
