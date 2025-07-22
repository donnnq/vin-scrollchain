// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinJerusalemKarmaShield
/// @notice Guardians pledge to love and protect Jerusalem. Any offense triggers triple-karma penalty.
contract vinJerusalemKarmaShield {
    address public scrollkeeper;
    mapping(address => bool) public guardians;
    mapping(address => uint256) public karmaDebt;

    event GuardianEnrolled(address indexed guardian);
    event GuardianRemoved(address indexed guardian);
    event OffenseLogged(
        address indexed offender,
        uint256 harm,
        uint256 karmaPenalty
    );

    modifier onlyKeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    modifier onlyGuardian() {
        require(guardians[msg.sender], "Not a guardian");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Sanctify a new guardian to watch over Jerusalem.
    function enrollGuardian(address guardian) external onlyKeeper {
        guardians[guardian] = true;
        emit GuardianEnrolled(guardian);
    }

    /// @notice Remove a guardian’s mantle.
    function removeGuardian(address guardian) external onlyKeeper {
        guardians[guardian] = false;
        emit GuardianRemoved(guardian);
    }

    /// @notice Log an offense against Jerusalem. Harm is measured in abstract units.
    /// Karma returns triple: offender’s debt increases by harm * 3.
    function logOffense(address offender, uint256 harm)
        external
        onlyGuardian
    {
        uint256 penalty = harm * 3;
        karmaDebt[offender] += penalty;
        emit OffenseLogged(offender, harm, penalty);
    }

    /// @notice Check the total karma debt owed by any address.
    function getKarmaDebt(address user) external view returns (uint256) {
        return karmaDebt[user];
    }
}
