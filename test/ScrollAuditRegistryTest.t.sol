// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../contracts/ScrollAuditRegistry.sol";

contract ScrollAuditRegistryTest is Test {
    ScrollAuditRegistry registry;

    function setUp() public {
        registry = new ScrollAuditRegistry();
    }

    function testLogAuditEntry() public {
        registry.logAudit(
            "Tornado Cash",
            "https://tornadoeth.cash/audits/TornadoCash_Classic_dApp_audit_Decurity.pdf",
            "IPFS dApp hijacking via unrestricted LocalStorage",
            "High",
            "Restricted LocalStorage to netId only, added frontend warning"
        );

        ScrollAuditRegistry.AuditEntry memory entry = registry.getAudit(0);
        assertEq(entry.mixerName, "Tornado Cash");
    }
}
