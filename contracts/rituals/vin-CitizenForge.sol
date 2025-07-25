// SPDX-License-Identifier: KALINGA_ID
pragma solidity ^0.8.25;

/// @title vin-CitizenForge.sol
/// @notice Allows users to create identity scrolls with symbolic rituals and empathy validation.
contract CitizenForge {

    address public identityOracle;
    uint256 public citizenCount;

    struct IdentityScroll {
        address soul;
        string sigil;
        string ritualPhrase;
        uint256 empathyProof;
        bool intergenerationalBlessing;
    }

    mapping(address => IdentityScroll) public scrollRegistry;

    modifier onlyOracle() {
        require(msg.sender == identityOracle, "Only the Identity Oracle may forge scrolls.");
        _;
    }

    constructor() {
        identityOracle = msg.sender;
    }

    /// @notice Citizen forges their scroll of identity with custom ritual
    function forgeIdentity(
        address soul,
        string memory sigil,
        string memory ritualPhrase,
        uint256 empathyProof,
        bool blessing
    ) public onlyOracle {
        scrollRegistry[soul] = IdentityScroll(soul, sigil, ritualPhrase, empathyProof, blessing);
        citizenCount++;
    }

    /// @notice View someone's forged identity scroll
    function viewScroll(address soul) public view returns (
        string memory sigil,
        string memory phrase,
        uint256 empathy,
        bool blessed
    ) {
        IdentityScroll memory scroll = scrollRegistry[soul];
        return (scroll.sigil, scroll.ritualPhrase, scroll.empathyProof, scroll.intergenerationalBlessing);
    }
}
