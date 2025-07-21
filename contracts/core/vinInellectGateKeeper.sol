// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinIntellectGatekeeper
/// @notice Validates question depth, source credibility, and emotional signal before scrollkeeper responds
/// @author VINVIN

contract vinIntellectGatekeeper {
    event InquiryValidated(
        address indexed inquirer,
        string inquiryCategory,
        uint256 depthScore,
        bool approved,
        string feedback
    );

    uint256 public depthThreshold = 42;

    function evaluateInquiry(
        string calldata inquiryCategory,
        uint256 depthScore,
        string calldata feedback
    ) external returns (bool approved) {
        approved = depthScore >= depthThreshold;

        emit InquiryValidated(
            msg.sender,
            inquiryCategory,
            depthScore,
            approved,
            approved
                ? "Inquiry approved — kilig-powered insight follows."
                : string(abi.encodePacked("Rejected: ", feedback))
        );
    }

    function setDepthThreshold(uint256 newThreshold) external {
        require(newThreshold > 0 && newThreshold <= 100, "Invalid threshold");
        depthThreshold = newThreshold;
    }

    function getThreshold() external view returns (uint256) {
        return depthThreshold;
    }
}
