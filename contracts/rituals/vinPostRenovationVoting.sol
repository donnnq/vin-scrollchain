// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinPostRenovationVoting {
    address public oracle;

    enum Path {Return, Relocate, Cooperative}
    mapping(address => bool) public hasVoted;
    mapping(Path => uint256) public votes;

    event VoteCast(address indexed resident, Path chosenPath);

    modifier onlyOnce() {
        require(!hasVoted[msg.sender], "Scroll already etched.");
        _;
    }

    constructor() {
        oracle = msg.sender;
    }

    function castVote(Path _path) public onlyOnce {
        hasVoted[msg.sender] = true;
        votes[_path] += 1;
        emit VoteCast(msg.sender, _path);
    }

    function getVoteCount(Path _path) public view returns (uint256) {
        return votes[_path];
    }

    function resetVotes() public {
        require(msg.sender == oracle, "Only the oracle may reset scrolls.");
        votes[Path.Return] = 0;
        votes[Path.Relocate] = 0;
        votes[Path.Cooperative] = 0;
    }
}
