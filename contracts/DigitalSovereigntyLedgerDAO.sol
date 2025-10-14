// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyLog {
        string transactionType;
        string platform;
        string currencyUsed;
        string sovereigntyScore;
    }

    SovereigntyLog[] public logs;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logTransaction(string memory _transactionType, string memory _platform, string memory _currencyUsed, string memory _sovereigntyScore) external onlyAdmin {
        logs.push(SovereigntyLog(_transactionType, _platform, _currencyUsed, _sovereigntyScore));
    }

    function getLog(uint256 index) external view returns (SovereigntyLog memory) {
        return logs[index];
    }
}
