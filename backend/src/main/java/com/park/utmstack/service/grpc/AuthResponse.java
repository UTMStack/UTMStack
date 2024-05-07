// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: agent.proto

package com.park.utmstack.service.grpc;

/**
 * Protobuf type {@code agent.AuthResponse}
 */
public final class AuthResponse extends
    com.google.protobuf.GeneratedMessageV3 implements
    // @@protoc_insertion_point(message_implements:agent.AuthResponse)
    AuthResponseOrBuilder {
private static final long serialVersionUID = 0L;
  // Use AuthResponse.newBuilder() to construct.
  private AuthResponse(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
    super(builder);
  }
  private AuthResponse() {
    agentKey_ = "";
  }

  @java.lang.Override
  @SuppressWarnings({"unused"})
  protected java.lang.Object newInstance(
      UnusedPrivateParameter unused) {
    return new AuthResponse();
  }

  public static final com.google.protobuf.Descriptors.Descriptor
      getDescriptor() {
    return com.park.utmstack.service.grpc.AgentManagerGrpc.internal_static_agent_AuthResponse_descriptor;
  }

  @java.lang.Override
  protected com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internalGetFieldAccessorTable() {
    return com.park.utmstack.service.grpc.AgentManagerGrpc.internal_static_agent_AuthResponse_fieldAccessorTable
        .ensureFieldAccessorsInitialized(
            com.park.utmstack.service.grpc.AuthResponse.class, com.park.utmstack.service.grpc.AuthResponse.Builder.class);
  }

  public static final int AGENT_ID_FIELD_NUMBER = 1;
  private long agentId_ = 0L;
  /**
   * <code>uint64 agent_id = 1;</code>
   * @return The agentId.
   */
  @java.lang.Override
  public long getAgentId() {
    return agentId_;
  }

  public static final int AGENT_KEY_FIELD_NUMBER = 2;
  @SuppressWarnings("serial")
  private volatile java.lang.Object agentKey_ = "";
  /**
   * <code>string agent_key = 2;</code>
   * @return The agentKey.
   */
  @java.lang.Override
  public java.lang.String getAgentKey() {
    java.lang.Object ref = agentKey_;
    if (ref instanceof java.lang.String) {
      return (java.lang.String) ref;
    } else {
      com.google.protobuf.ByteString bs = 
          (com.google.protobuf.ByteString) ref;
      java.lang.String s = bs.toStringUtf8();
      agentKey_ = s;
      return s;
    }
  }
  /**
   * <code>string agent_key = 2;</code>
   * @return The bytes for agentKey.
   */
  @java.lang.Override
  public com.google.protobuf.ByteString
      getAgentKeyBytes() {
    java.lang.Object ref = agentKey_;
    if (ref instanceof java.lang.String) {
      com.google.protobuf.ByteString b = 
          com.google.protobuf.ByteString.copyFromUtf8(
              (java.lang.String) ref);
      agentKey_ = b;
      return b;
    } else {
      return (com.google.protobuf.ByteString) ref;
    }
  }

  private byte memoizedIsInitialized = -1;
  @java.lang.Override
  public final boolean isInitialized() {
    byte isInitialized = memoizedIsInitialized;
    if (isInitialized == 1) return true;
    if (isInitialized == 0) return false;

    memoizedIsInitialized = 1;
    return true;
  }

  @java.lang.Override
  public void writeTo(com.google.protobuf.CodedOutputStream output)
                      throws java.io.IOException {
    if (agentId_ != 0L) {
      output.writeUInt64(1, agentId_);
    }
    if (!com.google.protobuf.GeneratedMessageV3.isStringEmpty(agentKey_)) {
      com.google.protobuf.GeneratedMessageV3.writeString(output, 2, agentKey_);
    }
    getUnknownFields().writeTo(output);
  }

  @java.lang.Override
  public int getSerializedSize() {
    int size = memoizedSize;
    if (size != -1) return size;

    size = 0;
    if (agentId_ != 0L) {
      size += com.google.protobuf.CodedOutputStream
        .computeUInt64Size(1, agentId_);
    }
    if (!com.google.protobuf.GeneratedMessageV3.isStringEmpty(agentKey_)) {
      size += com.google.protobuf.GeneratedMessageV3.computeStringSize(2, agentKey_);
    }
    size += getUnknownFields().getSerializedSize();
    memoizedSize = size;
    return size;
  }

  @java.lang.Override
  public boolean equals(final java.lang.Object obj) {
    if (obj == this) {
     return true;
    }
    if (!(obj instanceof com.park.utmstack.service.grpc.AuthResponse)) {
      return super.equals(obj);
    }
    com.park.utmstack.service.grpc.AuthResponse other = (com.park.utmstack.service.grpc.AuthResponse) obj;

    if (getAgentId()
        != other.getAgentId()) return false;
    if (!getAgentKey()
        .equals(other.getAgentKey())) return false;
    if (!getUnknownFields().equals(other.getUnknownFields())) return false;
    return true;
  }

  @java.lang.Override
  public int hashCode() {
    if (memoizedHashCode != 0) {
      return memoizedHashCode;
    }
    int hash = 41;
    hash = (19 * hash) + getDescriptor().hashCode();
    hash = (37 * hash) + AGENT_ID_FIELD_NUMBER;
    hash = (53 * hash) + com.google.protobuf.Internal.hashLong(
        getAgentId());
    hash = (37 * hash) + AGENT_KEY_FIELD_NUMBER;
    hash = (53 * hash) + getAgentKey().hashCode();
    hash = (29 * hash) + getUnknownFields().hashCode();
    memoizedHashCode = hash;
    return hash;
  }

  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      java.nio.ByteBuffer data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      java.nio.ByteBuffer data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data, extensionRegistry);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      com.google.protobuf.ByteString data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      com.google.protobuf.ByteString data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data, extensionRegistry);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(byte[] data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      byte[] data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return PARSER.parseFrom(data, extensionRegistry);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(java.io.InputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseWithIOException(PARSER, input);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseWithIOException(PARSER, input, extensionRegistry);
  }

  public static com.park.utmstack.service.grpc.AuthResponse parseDelimitedFrom(java.io.InputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseDelimitedWithIOException(PARSER, input);
  }

  public static com.park.utmstack.service.grpc.AuthResponse parseDelimitedFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseDelimitedWithIOException(PARSER, input, extensionRegistry);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      com.google.protobuf.CodedInputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseWithIOException(PARSER, input);
  }
  public static com.park.utmstack.service.grpc.AuthResponse parseFrom(
      com.google.protobuf.CodedInputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageV3
        .parseWithIOException(PARSER, input, extensionRegistry);
  }

  @java.lang.Override
  public Builder newBuilderForType() { return newBuilder(); }
  public static Builder newBuilder() {
    return DEFAULT_INSTANCE.toBuilder();
  }
  public static Builder newBuilder(com.park.utmstack.service.grpc.AuthResponse prototype) {
    return DEFAULT_INSTANCE.toBuilder().mergeFrom(prototype);
  }
  @java.lang.Override
  public Builder toBuilder() {
    return this == DEFAULT_INSTANCE
        ? new Builder() : new Builder().mergeFrom(this);
  }

  @java.lang.Override
  protected Builder newBuilderForType(
      com.google.protobuf.GeneratedMessageV3.BuilderParent parent) {
    Builder builder = new Builder(parent);
    return builder;
  }
  /**
   * Protobuf type {@code agent.AuthResponse}
   */
  public static final class Builder extends
      com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements
      // @@protoc_insertion_point(builder_implements:agent.AuthResponse)
      com.park.utmstack.service.grpc.AuthResponseOrBuilder {
    public static final com.google.protobuf.Descriptors.Descriptor
        getDescriptor() {
      return com.park.utmstack.service.grpc.AgentManagerGrpc.internal_static_agent_AuthResponse_descriptor;
    }

    @java.lang.Override
    protected com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
        internalGetFieldAccessorTable() {
      return com.park.utmstack.service.grpc.AgentManagerGrpc.internal_static_agent_AuthResponse_fieldAccessorTable
          .ensureFieldAccessorsInitialized(
              com.park.utmstack.service.grpc.AuthResponse.class, com.park.utmstack.service.grpc.AuthResponse.Builder.class);
    }

    // Construct using com.park.utmstack.service.grpc.AuthResponse.newBuilder()
    private Builder() {

    }

    private Builder(
        com.google.protobuf.GeneratedMessageV3.BuilderParent parent) {
      super(parent);

    }
    @java.lang.Override
    public Builder clear() {
      super.clear();
      bitField0_ = 0;
      agentId_ = 0L;
      agentKey_ = "";
      return this;
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.Descriptor
        getDescriptorForType() {
      return com.park.utmstack.service.grpc.AgentManagerGrpc.internal_static_agent_AuthResponse_descriptor;
    }

    @java.lang.Override
    public com.park.utmstack.service.grpc.AuthResponse getDefaultInstanceForType() {
      return com.park.utmstack.service.grpc.AuthResponse.getDefaultInstance();
    }

    @java.lang.Override
    public com.park.utmstack.service.grpc.AuthResponse build() {
      com.park.utmstack.service.grpc.AuthResponse result = buildPartial();
      if (!result.isInitialized()) {
        throw newUninitializedMessageException(result);
      }
      return result;
    }

    @java.lang.Override
    public com.park.utmstack.service.grpc.AuthResponse buildPartial() {
      com.park.utmstack.service.grpc.AuthResponse result = new com.park.utmstack.service.grpc.AuthResponse(this);
      if (bitField0_ != 0) { buildPartial0(result); }
      onBuilt();
      return result;
    }

    private void buildPartial0(com.park.utmstack.service.grpc.AuthResponse result) {
      int from_bitField0_ = bitField0_;
      if (((from_bitField0_ & 0x00000001) != 0)) {
        result.agentId_ = agentId_;
      }
      if (((from_bitField0_ & 0x00000002) != 0)) {
        result.agentKey_ = agentKey_;
      }
    }

    @java.lang.Override
    public Builder clone() {
      return super.clone();
    }
    @java.lang.Override
    public Builder setField(
        com.google.protobuf.Descriptors.FieldDescriptor field,
        java.lang.Object value) {
      return super.setField(field, value);
    }
    @java.lang.Override
    public Builder clearField(
        com.google.protobuf.Descriptors.FieldDescriptor field) {
      return super.clearField(field);
    }
    @java.lang.Override
    public Builder clearOneof(
        com.google.protobuf.Descriptors.OneofDescriptor oneof) {
      return super.clearOneof(oneof);
    }
    @java.lang.Override
    public Builder setRepeatedField(
        com.google.protobuf.Descriptors.FieldDescriptor field,
        int index, java.lang.Object value) {
      return super.setRepeatedField(field, index, value);
    }
    @java.lang.Override
    public Builder addRepeatedField(
        com.google.protobuf.Descriptors.FieldDescriptor field,
        java.lang.Object value) {
      return super.addRepeatedField(field, value);
    }
    @java.lang.Override
    public Builder mergeFrom(com.google.protobuf.Message other) {
      if (other instanceof com.park.utmstack.service.grpc.AuthResponse) {
        return mergeFrom((com.park.utmstack.service.grpc.AuthResponse)other);
      } else {
        super.mergeFrom(other);
        return this;
      }
    }

    public Builder mergeFrom(com.park.utmstack.service.grpc.AuthResponse other) {
      if (other == com.park.utmstack.service.grpc.AuthResponse.getDefaultInstance()) return this;
      if (other.getAgentId() != 0L) {
        setAgentId(other.getAgentId());
      }
      if (!other.getAgentKey().isEmpty()) {
        agentKey_ = other.agentKey_;
        bitField0_ |= 0x00000002;
        onChanged();
      }
      this.mergeUnknownFields(other.getUnknownFields());
      onChanged();
      return this;
    }

    @java.lang.Override
    public final boolean isInitialized() {
      return true;
    }

    @java.lang.Override
    public Builder mergeFrom(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      if (extensionRegistry == null) {
        throw new java.lang.NullPointerException();
      }
      try {
        boolean done = false;
        while (!done) {
          int tag = input.readTag();
          switch (tag) {
            case 0:
              done = true;
              break;
            case 8: {
              agentId_ = input.readUInt64();
              bitField0_ |= 0x00000001;
              break;
            } // case 8
            case 18: {
              agentKey_ = input.readStringRequireUtf8();
              bitField0_ |= 0x00000002;
              break;
            } // case 18
            default: {
              if (!super.parseUnknownField(input, extensionRegistry, tag)) {
                done = true; // was an endgroup tag
              }
              break;
            } // default:
          } // switch (tag)
        } // while (!done)
      } catch (com.google.protobuf.InvalidProtocolBufferException e) {
        throw e.unwrapIOException();
      } finally {
        onChanged();
      } // finally
      return this;
    }
    private int bitField0_;

    private long agentId_ ;
    /**
     * <code>uint64 agent_id = 1;</code>
     * @return The agentId.
     */
    @java.lang.Override
    public long getAgentId() {
      return agentId_;
    }
    /**
     * <code>uint64 agent_id = 1;</code>
     * @param value The agentId to set.
     * @return This builder for chaining.
     */
    public Builder setAgentId(long value) {

      agentId_ = value;
      bitField0_ |= 0x00000001;
      onChanged();
      return this;
    }
    /**
     * <code>uint64 agent_id = 1;</code>
     * @return This builder for chaining.
     */
    public Builder clearAgentId() {
      bitField0_ = (bitField0_ & ~0x00000001);
      agentId_ = 0L;
      onChanged();
      return this;
    }

    private java.lang.Object agentKey_ = "";
    /**
     * <code>string agent_key = 2;</code>
     * @return The agentKey.
     */
    public java.lang.String getAgentKey() {
      java.lang.Object ref = agentKey_;
      if (!(ref instanceof java.lang.String)) {
        com.google.protobuf.ByteString bs =
            (com.google.protobuf.ByteString) ref;
        java.lang.String s = bs.toStringUtf8();
        agentKey_ = s;
        return s;
      } else {
        return (java.lang.String) ref;
      }
    }
    /**
     * <code>string agent_key = 2;</code>
     * @return The bytes for agentKey.
     */
    public com.google.protobuf.ByteString
        getAgentKeyBytes() {
      java.lang.Object ref = agentKey_;
      if (ref instanceof String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (java.lang.String) ref);
        agentKey_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }
    /**
     * <code>string agent_key = 2;</code>
     * @param value The agentKey to set.
     * @return This builder for chaining.
     */
    public Builder setAgentKey(
        java.lang.String value) {
      if (value == null) { throw new NullPointerException(); }
      agentKey_ = value;
      bitField0_ |= 0x00000002;
      onChanged();
      return this;
    }
    /**
     * <code>string agent_key = 2;</code>
     * @return This builder for chaining.
     */
    public Builder clearAgentKey() {
      agentKey_ = getDefaultInstance().getAgentKey();
      bitField0_ = (bitField0_ & ~0x00000002);
      onChanged();
      return this;
    }
    /**
     * <code>string agent_key = 2;</code>
     * @param value The bytes for agentKey to set.
     * @return This builder for chaining.
     */
    public Builder setAgentKeyBytes(
        com.google.protobuf.ByteString value) {
      if (value == null) { throw new NullPointerException(); }
      checkByteStringIsUtf8(value);
      agentKey_ = value;
      bitField0_ |= 0x00000002;
      onChanged();
      return this;
    }
    @java.lang.Override
    public final Builder setUnknownFields(
        final com.google.protobuf.UnknownFieldSet unknownFields) {
      return super.setUnknownFields(unknownFields);
    }

    @java.lang.Override
    public final Builder mergeUnknownFields(
        final com.google.protobuf.UnknownFieldSet unknownFields) {
      return super.mergeUnknownFields(unknownFields);
    }


    // @@protoc_insertion_point(builder_scope:agent.AuthResponse)
  }

  // @@protoc_insertion_point(class_scope:agent.AuthResponse)
  private static final com.park.utmstack.service.grpc.AuthResponse DEFAULT_INSTANCE;
  static {
    DEFAULT_INSTANCE = new com.park.utmstack.service.grpc.AuthResponse();
  }

  public static com.park.utmstack.service.grpc.AuthResponse getDefaultInstance() {
    return DEFAULT_INSTANCE;
  }

  private static final com.google.protobuf.Parser<AuthResponse>
      PARSER = new com.google.protobuf.AbstractParser<AuthResponse>() {
    @java.lang.Override
    public AuthResponse parsePartialFrom(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      Builder builder = newBuilder();
      try {
        builder.mergeFrom(input, extensionRegistry);
      } catch (com.google.protobuf.InvalidProtocolBufferException e) {
        throw e.setUnfinishedMessage(builder.buildPartial());
      } catch (com.google.protobuf.UninitializedMessageException e) {
        throw e.asInvalidProtocolBufferException().setUnfinishedMessage(builder.buildPartial());
      } catch (java.io.IOException e) {
        throw new com.google.protobuf.InvalidProtocolBufferException(e)
            .setUnfinishedMessage(builder.buildPartial());
      }
      return builder.buildPartial();
    }
  };

  public static com.google.protobuf.Parser<AuthResponse> parser() {
    return PARSER;
  }

  @java.lang.Override
  public com.google.protobuf.Parser<AuthResponse> getParserForType() {
    return PARSER;
  }

  @java.lang.Override
  public com.park.utmstack.service.grpc.AuthResponse getDefaultInstanceForType() {
    return DEFAULT_INSTANCE;
  }

}

