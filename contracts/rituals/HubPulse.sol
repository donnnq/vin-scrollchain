// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HubPulse {
    address public admin;

    enum Status {Inactive, Active, Thriving, UnderAudit}
    
    struct Center {
        string location;
        Status status;
        uint256 lastCheckIn;
    }

    mapping(string => Center) public centers;

    event StatusUpdated(string location, Status status);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function updateCenterStatus(string calldata location, Status newStatus) external onlyAdmin {
        centers[location] = Center(location, newStatus, block.timestamp);
        emit StatusUpdated(location, newStatus);
    }

    function getCenterStatus(string calldata location) external view returns (Status) {
        return centers[location].status;
    }
}
