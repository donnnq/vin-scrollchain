// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TenantSovereigntyDAO {
    address public admin;

    struct Tenant {
        address wallet;
        bool verified;
        uint256 rentSupportReceived;
    }

    mapping(address => Tenant) public tenants;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyTenant(address _wallet) external onlyAdmin {
        tenants[_wallet] = Tenant(_wallet, true, 0);
    }

    function requestRentSupport(address _wallet, uint256 _amount) external {
        require(tenants[_wallet].verified, "Tenant not verified");
        tenants[_wallet].rentSupportReceived += _amount;
        payable(_wallet).transfer(_amount);
    }
}
