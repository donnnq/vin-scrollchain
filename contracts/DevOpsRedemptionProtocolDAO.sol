// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevOpsRedemptionProtocolDAO {
    address public admin;

    struct RedemptionEntry {
        string repoName;
        string breachType;
        string redemptionAction;
        string emotionalTag;
        bool resolved;
    }

    RedemptionEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRedemption(string memory _repoName, string memory _breachType, string memory _redemptionAction, string memory _emotionalTag) external onlyAdmin {
        protocols.push(RedemptionEntry(_repoName, _breachType, _redemptionAction, _emotionalTag, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        protocols[index].resolved = true;
    }

    function getRedemption(uint256 index) external view returns (RedemptionEntry memory) {
        return protocols[index];
    }
}
