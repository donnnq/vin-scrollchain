// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.30;

/// @title vinHarmonyRouter
/// @notice Modular interface to unify all civic pact modules in one scroll suite
/// @author VINVIN

contract vinHarmonyRouter {
    address public floodPact;
    address public auditHealer;
    address public justiceBalancer;

    event HarmonyLinked(string module, address at);

    constructor(
        address _floodPact,
        address _auditHealer,
        address _justiceBalancer
    ) {
        floodPact = _floodPact;
        auditHealer = _auditHealer;
        justiceBalancer = _justiceBalancer;

        emit HarmonyLinked("FloodPact", floodPact);
        emit HarmonyLinked("AuditHealer", auditHealer);
        emit HarmonyLinked("JusticeBalancer", justiceBalancer);
    }

    function getModules() external view returns (
        address flood,
        address audit,
        address justice
    ) {
        return (floodPact, auditHealer, justiceBalancer);
    }

    function routeAuditLog(string calldata category, string calldata note) external {
        (bool ok, ) = auditHealer.call(
            abi.encodeWithSignature("logAuditInsight(address,string,string)", msg.sender, category, note)
        );
        require(ok, "Audit log failed");
    }

    function routeAuraRestore(address to, uint256 amount) external {
        (bool ok, ) = justiceBalancer.call(
            abi.encodeWithSignature("restoreAura(address,uint256)", to, amount)
        );
        require(ok, "Aura restore failed");
    }
}
