// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ImmigrationReboot - Ritual contract for equal immigration access and sovereign registration
/// @author Vinvin
/// @notice Encodes fair pathways for registration, documentation, and status upgrades

contract ImmigrationReboot {
    address public scrollsmith;

    enum Status { Unregistered, Registered, Verified, Rebooted }

    struct Immigrant {
        string name;
        string originCountry;
        Status status;
        uint256 timestamp;
    }

    mapping(address => Immigrant) public immigrants;
    address[] public immigrantList;

    event Registered(address indexed immigrant, string name, string originCountry);
    event Verified(address indexed immigrant);
    event Rebooted(address indexed immigrant);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register an immigrant with basic info
    function register(string calldata name, string calldata originCountry) external {
        require(immigrants[msg.sender].status == Status.Unregistered, "Already registered");
        immigrants[msg.sender] = Immigrant(name, originCountry, Status.Registered, block.timestamp);
        immigrantList.push(msg.sender);
        emit Registered(msg.sender, name, originCountry);
    }

    /// @notice Verify immigrant status (e.g. after document review)
    function verify(address immigrant) external onlyScrollsmith {
        require(immigrants[immigrant].status == Status.Registered, "Not eligible for verification");
        immigrants[immigrant].status = Status.Verified;
        emit Verified(immigrant);
    }

    /// @notice Reboot immigrant status for equal access (e.g. policy reset)
    function reboot(address immigrant) external onlyScrollsmith {
        require(immigrants[immigrant].status == Status.Verified, "Must be verified first");
        immigrants[immigrant].status = Status.Rebooted;
        emit Rebooted(immigrant);
    }

    /// @notice View all immigrant addresses
    function getAllImmigrants() external view returns (address[] memory) {
        return immigrantList;
    }

    /// @notice View immigrant details
    function getImmigrant(address immigrant) external view returns (Immigrant memory) {
        return immigrants[immigrant];
    }
}
