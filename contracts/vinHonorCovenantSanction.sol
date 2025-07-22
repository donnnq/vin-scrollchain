// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinHonorCovenantSanction
/// @notice Enforces consequences for breaking sacred agreements in onchain governance or guild operations
contract vinHonorCovenantSanction {
    address public scrollkeeper;
    mapping(address => bool) public signatories;
    mapping(address => bool) public violated;
    mapping(address => uint256) public rank;

    event AgreementSigned(address indexed agent);
    event ViolationLogged(address indexed agent);
    event RankReduced(address indexed agent, uint256 newRank);

    modifier onlyKeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function signAgreement(address agent) external onlyKeeper {
        signatories[agent] = true;
        rank[agent] = 5; // starting honor rank
        emit AgreementSigned(agent);
    }

    function logViolation(address agent) external onlyKeeper {
        require(signatories[agent], "Not bound to agreement");
        violated[agent] = true;
        rank[agent] = rank[agent] > 1 ? rank[agent] - 1 : 0; // reduce rank
        emit ViolationLogged(agent);
        emit RankReduced(agent, rank[agent]);
    }

    function getHonorStatus(address agent) external view returns (bool bound, bool broke, uint256 honorRank) {
        bound = signatories[agent];
        broke = violated[agent];
        honorRank = rank[agent];
    }
}
