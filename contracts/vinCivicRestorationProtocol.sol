// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IScrollOfChecksAndBalances {
    function getImbalanceCount() external view returns (uint256);
}

contract vinCivicRestorationProtocol {
    address public protocolAdmin;
    uint256 public reformThreshold = 5;

    IScrollOfChecksAndBalances public alertContract;

    struct ReformSuggestion {
        string title;
        string description;
        uint256 timestamp;
    }

    ReformSuggestion[] public reformLog;

    event ReformTriggered(string title, string description);

    modifier onlyAdmin() {
        require(msg.sender == protocolAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin, address _alertContract) {
        protocolAdmin = _admin;
        alertContract = IScrollOfChecksAndBalances(_alertContract);
    }

    function checkAndSuggestReform(string memory title, string memory description) external onlyAdmin {
        uint256 imbalance = alertContract.getImbalanceCount();
        require(imbalance >= reformThreshold, "Imbalance not yet critical");

        reformLog.push(ReformSuggestion(title, description, block.timestamp));
        emit ReformTriggered(title, description);
    }

    function getReform(uint256 index) external view returns (ReformSuggestion memory) {
        require(index < reformLog.length, "Invalid index");
        return reformLog[index];
    }

    function getTotalReforms() external view returns (uint256) {
        return reformLog.length;
    }
}
