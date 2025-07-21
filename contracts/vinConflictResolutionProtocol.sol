// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinConflictResolutionProtocol {
    enum ResolutionStatus { Proposed, UnderMediation, Accepted, Rejected }

    struct ConflictScroll {
        string partiesInvolved;
        string issueDescription;
        address proposer;
        uint256 timestamp;
        ResolutionStatus status;
        string resolutionTerms;
    }

    uint256 public conflictCount;
    address public scrollkeeper;
    mapping(uint256 => ConflictScroll) public conflicts;
    mapping(address => bool) public mediators;

    event ConflictProposed(uint256 indexed id, string parties);
    event ResolutionUpdated(uint256 indexed id, ResolutionStatus status, string resolutionTerms);

    constructor() {
        scrollkeeper = msg.sender;
        mediators[msg.sender] = true; // deployer is first mediator
    }

    modifier onlyMediator() {
        require(mediators[msg.sender], "Not authorized mediator");
        _;
    }

    function proposeConflictScroll(
        string memory _partiesInvolved,
        string memory _issueDescription
    ) public {
        conflicts[conflictCount] = ConflictScroll({
            partiesInvolved: _partiesInvolved,
            issueDescription: _issueDescription,
            proposer: msg.sender,
            timestamp: block.timestamp,
            status: ResolutionStatus.Proposed,
            resolutionTerms: ""
        });

        emit ConflictProposed(conflictCount, _partiesInvolved);
        conflictCount++;
    }

    function updateResolutionStatus(
        uint256 _id,
        ResolutionStatus _newStatus,
        string memory _resolutionTerms
    ) public onlyMediator {
        require(_id < conflictCount, "Conflict does not exist.");
        ConflictScroll storage scroll = conflicts[_id];
        scroll.status = _newStatus;
        scroll.resolutionTerms = _resolutionTerms;
        emit ResolutionUpdated(_id, _newStatus, _resolutionTerms);
    }

    function assignMediator(address _newMediator) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can assign mediators.");
        mediators[_newMediator] = true;
    }

    function getConflictScroll(uint256 _id) public view returns (ConflictScroll memory) {
        return conflicts[_id];
    }
}
