// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinReviewerAccess {
    address public scrollMaster;
    mapping(address => bool) public approvedReviewers;
    string[] public linkedConstitutions;
    uint256 public accessTimestamp;

    event ReviewerGranted(address indexed reviewer, uint256 timeGranted);
    event ReviewerRevoked(address indexed reviewer, uint256 timeRevoked);
    event ConstitutionLinked(string constitutionName, uint256 timeLinked);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Not authorized.");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
        accessTimestamp = block.timestamp;
    }

    /// @notice Grant review access to an address
    /// @param reviewer The address to be approved
    function grantReviewerAccess(address reviewer) external onlyScrollMaster {
        approvedReviewers[reviewer] = true;
        emit ReviewerGranted(reviewer, block.timestamp);
    }

    /// @notice Revoke review access from an address
    /// @param reviewer The address to be revoked
    function revokeReviewerAccess(address reviewer) external onlyScrollMaster {
        approvedReviewers[reviewer] = false;
        emit ReviewerRevoked(reviewer, block.timestamp);
    }

    /// @notice Link a constitution or project identifier for review context
    /// @param constitutionName The name or URI of the linked constitution
    function linkConstitution(string calldata constitutionName) external onlyScrollMaster {
        linkedConstitutions.push(constitutionName);
        emit ConstitutionLinked(constitutionName, block.timestamp);
    }

    /// @notice Check if an address is an approved reviewer
    /// @param user The address to check
    /// @return True if approved, false otherwise
    function isReviewer(address user) external view returns (bool) {
        return approvedReviewers[user];
    }

    /// @notice Get total number of linked constitutions
    /// @return count of linked constitutions
    function getConstitutionCount() external view returns (uint256) {
        return linkedConstitutions.length;
    }

    /// @notice Retrieve a linked constitution by index
    /// @param index The index in the array
    /// @return constitutionName The linked name or URI
    function getConstitution(uint256 index) external view returns (string memory constitutionName) {
        require(index < linkedConstitutions.length, "Index out of bounds");
        return linkedConstitutions[index];
    }

    /// @notice Refresh the access timestamp (e.g., after a major update)
    function updateAccessTimestamp() external onlyScrollMaster {
        accessTimestamp = block.timestamp;
    }
}
