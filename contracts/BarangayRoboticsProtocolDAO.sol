// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRoboticsProtocolDAO {
    address public admin;

    struct RoboticsEntry {
        string barangay;
        string robotType;
        string deploymentPurpose;
        string emotionalTag;
        bool deployed;
    }

    RoboticsEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _barangay, string memory _robotType, string memory _deploymentPurpose, string memory _emotionalTag) external onlyAdmin {
        protocols.push(RoboticsEntry(_barangay, _robotType, _deploymentPurpose, _emotionalTag, false));
    }

    function deployRobot(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (RoboticsEntry memory) {
        return protocols[index];
    }
}
