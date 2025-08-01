// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinWardenOfScrollSanctions.sol
/// @notice Ritual enforcer for sanctioning corrupt officials based on strike logs and court rulings.
/// @author Vinvin

interface OffenderLog {
    function records(address) external view returns (uint256 strikeCount, uint256 lastTimestamp);
}

interface ScrollSanctum {
    function trials(uint256) external view returns (bool resolved, bool outcome);
}

contract vinWardenOfScrollSanctions {
    address public strikeLog;
    address public scrollCourt;
    mapping(address => bool) public blacklisted;

    event JusticeInvoked(address indexed violator, string sanction, uint256 strength);
    event WarningBroadcasted(string message);

    constructor(address _strikeLog, address _scrollCourt) {
        strikeLog = _strikeLog;
        scrollCourt = _scrollCourt;
    }

    function enforceByStrike(address soul) public {
        (uint256 count, ) = OffenderLog(strikeLog).records(soul);
        require(count > 0, "No recorded strikes");

        if (count >= 5) {
            blacklisted[soul] = true;
            emit JusticeInvoked(soul, "Indictment glyph cast", count);
        } else if (count >= 3) {
            emit JusticeInvoked(soul, "Fine and civic role suspension", count);
        } else {
            emit WarningBroadcasted("Warning: Civic violations detected. Further strikes will trigger scroll sanctions.");
        }
    }

    function enforceByJudgment(uint256 trialId, address accused) public {
        (bool resolved, bool guilty) = ScrollSanctum(scrollCourt).trials(trialId);
        require(resolved && guilty, "No valid judgment to enforce");

        blacklisted[accused] = true;
        emit JusticeInvoked(accused, "Judgment-based sanction deployed", 100);
    }

    function isBlacklisted(address soul) public view returns (bool) {
        return blacklisted[soul];
    }
}
