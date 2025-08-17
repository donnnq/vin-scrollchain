// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.0;

contract vinNorthKoreaDigitalLockdown {
    address public steward;
    bool public isLocked = true;

    mapping(string => bool) public blockedDomains;
    mapping(address => bool) public blockedWallets;
    mapping(string => bool) public blockedIPs;

    event DomainBlocked(string domain);
    event WalletBlocked(address wallet);
    event IPBlocked(string ip);
    event LockStatusChanged(bool status);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized glyph");
        _;
    }

    modifier whenLocked() {
        require(isLocked, "Lockdown not active");
        _;
    }

    constructor() {
        steward = msg.sender;

        // Preload known Lazarus/North Korean assets
        blockedDomains["nk.gov.kp"] = true;
        blockedDomains["lazarus-chain.io"] = true;
        blockedIPs["175.45.176.0"] = true; // Known NK subnet
        blockedWallets[0xDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF] = true;
    }

    function blockDomain(string memory _domain) public onlySteward whenLocked {
        blockedDomains[_domain] = true;
        emit DomainBlocked(_domain);
    }

    function blockWallet(address _wallet) public onlySteward whenLocked {
        blockedWallets[_wallet] = true;
        emit WalletBlocked(_wallet);
    }

    function blockIP(string memory _ip) public onlySteward whenLocked {
        blockedIPs[_ip] = true;
        emit IPBlocked(_ip);
    }

    function unlock() public onlySteward {
        isLocked = false;
        emit LockStatusChanged(false);
    }

    function lock() public onlySteward {
        isLocked = true;
        emit LockStatusChanged(true);
    }
}
