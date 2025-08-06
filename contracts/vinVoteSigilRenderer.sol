// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVoteRelay {
    function getVotes(uint256 reformId) external view returns (uint256 yes, uint256 no);
}

contract vinVoteSigilRenderer {
    IVoteRelay public voteRelay;

    constructor(address _voteRelay) {
        voteRelay = IVoteRelay(_voteRelay);
    }

    function renderSigil(uint256 reformId) external view returns (string memory) {
        (uint256 yes, uint256 no) = voteRelay.getVotes(reformId);
        uint256 total = yes + no;

        if (total == 0) return "⚪ Neutral Sigil";

        uint256 ratio = (yes * 100) / total;

        if (ratio >= 75) return "🟢 Mandate Sigil";
        if (ratio >= 50) return "🟡 Majority Sigil";
        return "🔴 Rejection Sigil";
    }
}
