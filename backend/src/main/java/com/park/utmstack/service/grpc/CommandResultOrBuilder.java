// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: agent.proto

package com.park.utmstack.service.grpc;

public interface CommandResultOrBuilder extends
    // @@protoc_insertion_point(interface_extends:agent.CommandResult)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <code>string agent_key = 1;</code>
   * @return The agentKey.
   */
  java.lang.String getAgentKey();
  /**
   * <code>string agent_key = 1;</code>
   * @return The bytes for agentKey.
   */
  com.google.protobuf.ByteString
      getAgentKeyBytes();

  /**
   * <code>string result = 2;</code>
   * @return The result.
   */
  java.lang.String getResult();
  /**
   * <code>string result = 2;</code>
   * @return The bytes for result.
   */
  com.google.protobuf.ByteString
      getResultBytes();

  /**
   * <code>.google.protobuf.Timestamp executed_at = 3;</code>
   * @return Whether the executedAt field is set.
   */
  boolean hasExecutedAt();
  /**
   * <code>.google.protobuf.Timestamp executed_at = 3;</code>
   * @return The executedAt.
   */
  com.google.protobuf.Timestamp getExecutedAt();
  /**
   * <code>.google.protobuf.Timestamp executed_at = 3;</code>
   */
  com.google.protobuf.TimestampOrBuilder getExecutedAtOrBuilder();

  /**
   * <code>string cmd_id = 4;</code>
   * @return The cmdId.
   */
  java.lang.String getCmdId();
  /**
   * <code>string cmd_id = 4;</code>
   * @return The bytes for cmdId.
   */
  com.google.protobuf.ByteString
      getCmdIdBytes();
}
