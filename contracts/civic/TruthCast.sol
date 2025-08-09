// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TruthCast - Ritual scroll for verified news segments and civic protection
/// @author Vinvin
/// @notice Ensures news segments are fact-checked, protects contributors from legal threats unless harm is caused

contract TruthCast {
    address public scrollsmith;

    struct NewsSegment {
        address reporter;
        string headline;
        string content;
        bool isVerified;
        uint256 timestamp;
    }

    NewsSegment[] public segments;
    mapping(address => bool) public trustedVerifiers;
    mapping(address => bool) public protectedReporters;

    event SegmentSubmitted(address indexed reporter, string headline);
    event SegmentVerified(address indexed verifier, string headline);
    event ReporterProtected(address indexed reporter);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    modifier onlyVerifier() {
        require(trustedVerifiers[msg.sender], "Not a trusted verifier");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a news segment
    function submitSegment(string calldata headline, string calldata content) external {
        segments.push(NewsSegment(msg.sender, headline, content, false, block.timestamp));
        emit SegmentSubmitted(msg.sender, headline);
    }

    /// @notice Verify a news segment
    function verifySegment(uint256 segmentId) external onlyVerifier {
        require(segmentId < segments.length, "Invalid segment ID");
        segments[segmentId].isVerified = true;
        emit SegmentVerified(msg.sender, segments[segmentId].headline);
    }

    /// @notice Protect a reporter from legal threats (except for assault/harassment)
    function protectReporter(address reporter) external onlyScrollsmith {
        protectedReporters[reporter] = true;
        emit ReporterProtected(reporter);
    }

    /// @notice Add a trusted verifier
    function addVerifier(address verifier) external onlyScrollsmith {
        trustedVerifiers[verifier] = true;
    }

    /// @notice Check if a reporter is protected
    function isProtected(address reporter) external view returns (bool) {
        return protectedReporters[reporter];
    }

    /// @notice Get all segments
    function getAllSegments() external view returns (NewsSegment[] memory) {
        return segments;
    }
}
