
from aws_cdk import core
from aws_cdk import aws_config as config

class OpenSearchConfigRulesStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        opensearch_audit_logging_enabled: bool = True,
        opensearch_encrypted_at_rest: bool = True,
        opensearch_https_required: bool = True,
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # OpenSearch Audit Logging Config Rule
        if opensearch_audit_logging_enabled:
            config.ManagedRule(
                self,
                "OpenSearchAuditLoggingEnabled",
                config_rule_name="opensearch-audit-logging-enabled",
                description=(
                    "Checks if Amazon OpenSearch Service domains have audit logging enabled. "
                    "Triggered only when changes to OpenSearch resources are applied in an environment."
                ),
                identifier=config.ManagedRuleIdentifiers.OPENSEARCH_AUDIT_LOGGING_ENABLED,
            )

        # OpenSearch Encrypted at Rest Config Rule
        if opensearch_encrypted_at_rest:
            config.ManagedRule(
                self,
                "OpenSearchEncryptedAtRest",
                config_rule_name="opensearch-encrypted-at-rest",
                description=(
                    "Checks if Amazon OpenSearch Service domains are encrypted at rest."
                ),
                identifier=config.ManagedRuleIdentifiers.OPENSEARCH_ENCRYPTED_AT_REST,
            )

        # OpenSearch HTTPS Required Config Rule
        if opensearch_https_required:
            config.ManagedRule(
                self,
                "OpenSearchHttpsRequired",
                config_rule_name="opensearch-https-required",
                description=(
                    "Checks if Amazon OpenSearch Service domains require HTTPS for all traffic."
                ),
                identifier=config.ManagedRuleIdentifiers.OPENSEARCH_HTTPS_REQUIRED,
            )
