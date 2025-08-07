// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinInfraPulseMonitor.sol
/// @notice Enforces weekly updates and transparent reporting for infrastructure-related contracts.

contract vinInfraPulseMonitor {
    address public overseer;
    uint256 public updateCount;

    struct InfraUpdate {
        uint256 id;
        string siteName;
        string statusSummary;
        string visualProofLink;
        uint256 timestamp;
    }

    mapping(uint256 => InfraUpdate) public updates;
    mapping(address => bool) public registeredContractors;

    event ContractorRegistered(address indexed contractor);
    event WeeklyUpdateSubmitted(uint256 indexed id, string siteName);
    event ContractorFlagged(address indexed contractor);

    modifier onlyOverseer() {
        require(msg.sender == overseer, "Not authorized.");
        _;
    }

    constructor() {
        overseer = msg.sender;
    }

    function registerContractor(address _contractor) public onlyOverseer {
        registeredContractors[_contractor] = true;
        emit ContractorRegistered(_contractor);
    }

    function submitWeeklyUpdate(
        string memory _siteName,
        string memory _statusSummary,
        string memory _visualProofLink
    ) public {
        require(registeredContractors[msg.sender], "Contractor not registered.");
        updateCount++;
        updates[updateCount] = InfraUpdate(updateCount, _siteName, _statusSummary, _visualProofLink, block.timestamp);
        emit WeeklyUpdateSubmitted(updateCount, _siteName);
    }

    function flagContractor(address _contractor) public onlyOverseer {
        registeredContractors[_contractor] = false;
        emit ContractorFlagged(_contractor);
    }

    function viewUpdate(uint256 _id) public view returns (InfraUpdate memory) {
        return updates[_id];
    }

    function isContractorActive(address _contractor) public view returns (bool) {
        return registeredContractors[_contractor];
    }
}
