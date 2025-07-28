// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinHospitScrollPass {
    mapping(address => bool) public freeAccess;
    event AccessGranted(address indexed citizen);
    event AccessRevoked(address indexed citizen);

    function grantAccess(address citizen) external {
        freeAccess[citizen] = true;
        emit AccessGranted(citizen);
    }

    function revokeAccess(address citizen) external {
        freeAccess[citizen] = false;
        emit AccessRevoked(citizen);
    }

    function hasFreeAccess(address citizen) external view returns (bool) {
        return freeAccess[citizen];
    }
}
