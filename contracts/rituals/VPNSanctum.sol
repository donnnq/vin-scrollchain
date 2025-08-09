// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title VPNSanctum — A soulbound contract to protect VPN access as a civic right
/// @author Scrollsmith Vinvin
/// @notice This contract ritualizes digital privacy and defends encrypted freedom

contract VPNSanctum {
    address public scrollsmith;
    mapping(address => bool) public isSanctified;
    mapping(address => string) public encryptedReason;

    event Sanctified(address indexed citizen, string encryptedReason);
    event Revoked(address indexed violator, string reason);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "You are not the scrollsmith.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Sanctify a citizen's right to VPN access
    /// @param _citizen Address of the citizen
    /// @param _encryptedReason Encrypted justification for VPN use
    function sanctify(address _citizen, string memory _encryptedReason) public onlyScrollsmith {
        isSanctified[_citizen] = true;
        encryptedReason[_citizen] = _encryptedReason;
        emit Sanctified(_citizen, _encryptedReason);
    }

    /// @notice Revoke sanctification if misused
    /// @param _citizen Address of the violator
    /// @param _reason Public reason for revocation
    function revoke(address _citizen, string memory _reason) public onlyScrollsmith {
        isSanctified[_citizen] = false;
        emit Revoked(_citizen, _reason);
    }

    /// @notice Check if a citizen is sanctified
    /// @param _citizen Address to check
    /// @return True if sanctified, false otherwise
    function checkSanctum(address _citizen) public view returns (bool) {
        return isSanctified[_citizen];
    }
}
