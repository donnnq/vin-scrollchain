// SPDX-License-Identifier: UPLIFT
pragma solidity ^0.8.17;

contract vinKarmaFountain {
    address public scrollLord;

    struct KarmaStream {
        address contributor;
        uint256 mentorshipPoints;
        uint256 ecoPoints;
        uint256 dignityActs;
        uint256 totalKarma;
        bool rewardClaimed;
    }

    mapping(address => KarmaStream) public auraStream;
    uint256 public rewardThreshold = 100;

    event KarmaRewarded(address indexed contributor, uint256 totalKarma);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Only scrollLord channels karma.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function recordKarma(
        address contributor,
        uint256 mentorshipPoints,
        uint256 ecoPoints,
        uint256 dignityActs
    ) public onlyScrollLord {
        uint256 combined = mentorshipPoints + ecoPoints + dignityActs;
        auraStream[contributor] = KarmaStream(contributor, mentorshipPoints, ecoPoints, dignityActs, combined, false);

        if (combined >= rewardThreshold) {
            auraStream[contributor].rewardClaimed = true;
            emit KarmaRewarded(contributor, combined);
        }
    }

    function viewKarma(address contributor) public view returns (KarmaStream memory) {
        return auraStream[contributor];
    }
}
