// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformSovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyLog {
        string platformName;
        string sovereigntyTag;
        string corridorActivated;
        string emotionalTag;
        bool verified;
    }

    SovereigntyLog[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSovereignty(string memory _platformName, string memory _sovereigntyTag, string memory _corridorActivated, string memory _emotionalTag) external onlyAdmin {
        ledger.push(SovereigntyLog(_platformName, _sovereigntyTag, _corridorActivated, _emotionalTag, false));
    }

    function verifyLog(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getLog(uint256 index) external view returns (SovereigntyLog memory) {
        return ledger[index];
    }
}
