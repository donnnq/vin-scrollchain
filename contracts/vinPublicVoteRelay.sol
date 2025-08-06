// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICivicRestoration {
    function getReform(uint256 index) external view returns (
        string memory title,
        string memory description,
        uint256 timestamp
    );
    function getTotalReforms() external view returns (uint256);
}

contract vinPublicVoteRelay {
    address public voteAdmin;
    ICivicRestoration public restorationContract;

    struct VoteCount {
        uint256 yes;
        uint256 no;
        mapping(address => bool) hasVoted;
    }

    mapping(uint256 => VoteCount) public voteLedger;

    event VoteCast(uint256 reformId, address voter, bool support);

    modifier onlyAdmin() {
        require(msg.sender == voteAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin, address _restorationContract) {
        voteAdmin = _admin;
        restorationContract = ICivicRestoration(_restorationContract);
    }

    function castVote(uint256 reformId, bool support) external {
        require(reformId < restorationContract.getTotalReforms(), "Invalid reform ID");
        VoteCount storage votes = voteLedger[reformId];
        require(!votes.hasVoted[msg.sender], "Already voted");

        votes.hasVoted[msg.sender] = true;
        if (support) {
            votes.yes += 1;
        } else {
            votes.no += 1;
        }

        emit VoteCast(reformId, msg.sender, support);
    }

    function getVotes(uint256 reformId) external view returns (uint256 yes, uint256 no) {
        VoteCount storage votes = voteLedger[reformId];
        return (votes.yes, votes.no);
    }
}
