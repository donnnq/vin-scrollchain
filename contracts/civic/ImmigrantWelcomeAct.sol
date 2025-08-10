// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ImmigrantWelcomeAct - Ensures emotional safety, familial treatment, and trust-building for foreign immigrants
/// @author Vinvin
/// @notice Encodes protection, welcome rituals, and trust indicators for dignified integration

contract ImmigrantWelcomeAct {
    address public scrollsmith;

    enum Status { Newcomer, Welcomed, Trusted }

    struct Immigrant {
        address wallet;
        string name;
        string originCountry;
        Status status;
        bool feelsSafe;
        bool treatedAsFamily;
        string welcomeMessage;
        uint256 timestamp;
    }

    mapping(address => Immigrant) public immigrants;
    address[] public welcomeList;

    event Welcomed(address indexed immigrant, string message);
    event TrustEstablished(address indexed immigrant);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a newcomer immigrant
    function registerImmigrant(string calldata name, string calldata originCountry) external {
        require(immigrants[msg.sender].status == Status.Newcomer, "Already registered");

        immigrants[msg.sender] = Immigrant(
            msg.sender,
            name,
            originCountry,
            Status.Newcomer,
            false,
            false,
            "",
            block.timestamp
        );

        welcomeList.push(msg.sender);
    }

    /// @notice Mark immigrant as welcomed with emotional support
    function welcomeImmigrant(address immigrant, string calldata message) external onlyScrollsmith {
        Immigrant storage im = immigrants[immigrant];
        require(im.status == Status.Newcomer, "Already welcomed");

        im.status = Status.Welcomed;
        im.feelsSafe = true;
        im.treatedAsFamily = true;
        im.welcomeMessage = message;

        emit Welcomed(immigrant, message);
    }

    /// @notice Establish trust after sustained safety and care
    function establishTrust(address immigrant) external onlyScrollsmith {
        Immigrant storage im = immigrants[immigrant];
        require(im.status == Status.Welcomed, "Must be welcomed first");
        require(im.feelsSafe && im.treatedAsFamily, "Emotional safety required");

        im.status = Status.Trusted;
        emit TrustEstablished(immigrant);
    }

    /// @notice View all immigrants in the welcome list
    function getWelcomeList() external view returns (address[] memory) {
        return welcomeList;
    }

    /// @notice View immigrant details
    function getImmigrant(address immigrant) external view returns (Immigrant memory) {
        return immigrants[immigrant];
    }
}
