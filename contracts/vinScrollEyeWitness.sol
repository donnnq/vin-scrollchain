// Additions to the previous EyeWitness contract
function fileReportAdvanced(
    uint256 id,
    string memory site,
    string memory observation,
    uint256 locationCode,
    uint256 auraBoost
) public {
    bool legit = bytes(observation).length > 20;
    logs[id] = Report(msg.sender, site, observation, legit);
    if (legit) {
        vinScrollOfGuardianship(guardianship).logDeed(msg.sender, auraBoost);
    }
    emit ReportFiled(id, site, legit);
}
